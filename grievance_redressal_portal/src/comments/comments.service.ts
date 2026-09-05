import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateCommentDto } from './dto/create-comment.dto';
import { UpdateCommentContentDto } from './dto/update-comment-content.dto';
import { SoftDeleteCommentDto } from './dto/soft-delete-comment.dto';
import { SoftDeleteReplyDto } from './dto/soft-delete-reply.dto';
import { SearchCommentsByPostDto } from './dto/search-comments-by-post.dto';
import { CreateReplyDto } from './dto/create-reply.dto';

@Injectable()
export class CommentsService {
    constructor (private readonly prisma: PrismaService) {}

     async createComment(createCommentDto: CreateCommentDto) {
        return this.prisma.comment.create({
          data: createCommentDto
        });
      }

     async createReply(createReplyDto: CreateReplyDto) {
        ;
     }
    
      async displayAllPostComments(postId: number) {
        return this.prisma.$queryRaw`
        SELECT comment_content, comment_is_deleted
        FROM comments
        WHERE comments.post_id = ${postId};
      `;
      }

      async searchCommentsByPost(postId: number, searchCommentsByPostDto: SearchCommentsByPostDto) {
        return this.prisma.$queryRaw`
        SELECT comment_content, comment_is_deleted 
        FROM comments 
        WHERE post_id = ${postId} 
        AND comment_content ILIKE ${searchCommentsByPostDto.comment_content + '%'};
      `;
      }
    
      async updateCommentContent(commentId: number, parentCommentId: number, updateCommentContentDto: UpdateCommentContentDto) {
        
        return this.prisma.comment.update({
          where: {
            comment_id: commentId,
            parent_comment_id: parentCommentId
          },
          data: updateCommentContentDto
        })
      }
    
      async softDeleteComment(commentId: number, softDeleteCommentDto: SoftDeleteCommentDto) {
         return this.prisma.comment.update({
          where: {
            comment_id: commentId,
          },
          data: softDeleteCommentDto
        })
      }

      async softDeleteReply(commentId: number, parentCommentId: number, softDeleteReplyDto: SoftDeleteReplyDto) {
         return this.prisma.comment.update({
          where: {
            comment_id: commentId,
            parent_comment_id: parentCommentId
          },
          data: softDeleteReplyDto
        })
      }
    
      async hardDeleteComment(commentId: number) {
        return this.prisma.comment.delete({
        where: {
          comment_id: commentId,
        },
      });
    }

    async hardDeleteReply(commentId: number, parentCommentId: number) {
        return this.prisma.comment.delete({
        where: {
          comment_id: commentId,
          parent_comment_id: parentCommentId
        },
      })
    }

}