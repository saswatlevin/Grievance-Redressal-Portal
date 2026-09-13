import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateCommentDto } from './dto/create-comment.dto';
import { UpdateCommentContentDto } from './dto/update-comment-content.dto';
import { SoftDeleteCommentDto } from './dto/soft-delete-comment.dto';
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
      return this.prisma.comment.create({
        data: createReplyDto
      });
     }
    
      async displayAllPostComments(postId: number) {
          // Defining the type for comment. 
          type Comment = {
            comment_id: number;
            parent_id: number | null;
            comment_date_created_at: Date;
            comment_content: string;
            comment_is_deleted: boolean;
          };
          
          const comments = await this.prisma.$queryRaw<Comment[]>`
          SELECT comment_id, parent_id, comment_date_created_at, comment_content, comment_is_deleted
          FROM comments
          WHERE comments.post_id = ${postId};
        `;

          // Sorting the retrieved comments by comment_id and parent_id and putting them into an array.
          const sorted_comments_array = [...comments].sort((a, b) => {
            // Sort all the parent comments with null parent_id by comment_id first.
            if (a.parent_id === null && b.parent_id === null) {
              return a.comment_id - b.comment_id;
            }

            // Then sort all the child comments by parent_id.
            if (a.parent_id === null) return -1;
            if (b.parent_id === null) return 1;

            return a.parent_id - b.parent_id;
          });

          console.log("sorted_comments_array ", sorted_comments_array);
        
          // Creating a hash map for comments.
          const comment_map = new Map<number | null, Comment[]>();

          
          for (const comment of sorted_comments_array) {
            
            const current_parent_id: number | null = comment.parent_id;
            console.log("current_parent_id ", current_parent_id);

            const current_comment_id: number = comment.comment_id;
            console.log("current_comment_id ", current_comment_id);

            // If the comment is a root comment, then insert a new array with that root comment using that root comment's comment_id.
            // Here the comment_id is the key and the array (with that comment) is the value.
            if (current_parent_id === null) {
              console.log("Adding a comment with null parent_id");
              comment_map.set(current_comment_id, [comment]);
            } 

            else {

             // If this parent_id does not already have an entry in the Map,
             // this means that this comment is the first child encountered
             // for this parent.
             if (comment_map.has(current_parent_id) === false) {

                console.log("Creating new parent-child group");

                // Find the parent comment whose comment_id matches
                // the current comment's parent_id.
                const parent_comment = sorted_comments_array.find(
                  (candidate) => candidate.comment_id === current_parent_id
                );

                // If the parent comment was found, create a new array
                // containing the parent and the current child.
                if (parent_comment !== undefined) {
                  console.log("Adding a child comment that is a reply to a root comment as a k-v pair with a copy of that parent comment.");
                  comment_map.set(current_parent_id, [parent_comment, comment]);
                }
            }
            
            
            else {
              // If the comment is a child comment, then get the array stored under current_parent_id (which is the same as the comment_id of the respective root comment), then add the child comment to that array.
              // The ! operator is the NOT NULL ASSERTION OPERATOR. It tells TS that get() will not return an undefined value.
              console.log("Adding a child comment");
              comment_map.get(current_parent_id)!.push(comment);
            }
          }
            //console.log("comment_map ", comment_map);
    
          }

          //console.log("Completed comment_map ");
          //comment_map.forEach((comments, parentId) => {
            //console.log("Key:", parentId, ":::", " Comments:", comments);
          //});

        // Sorting the comments in each map array in ascending order of time (oldest to newest). 
         comment_map.forEach((comments) => {
            comments.sort((a, b) => {
              // Here since a - b < 0, so a gets put before b.
              return a.comment_date_created_at.getTime() - b.comment_date_created_at.getTime();
            });
          });

          console.log("Sorted comment_map ");
          comment_map.forEach((comments, parentId) => {
            console.log("Key:", parentId, ":::", " Comments:", comments);
          });
          
          return [];
        
      }

      async searchCommentsByPost(postId: number, searchCommentsByPostDto: SearchCommentsByPostDto) {
        return this.prisma.$queryRaw`
        SELECT comment_id, parent_id, comment_date_created_at, comment_content, comment_is_deleted
        FROM comments 
        WHERE post_id = ${postId} 
        AND comment_content ILIKE ${'%' + searchCommentsByPostDto.comment_content + '%'};
      `;
      }
    
      async updateCommentContent(commentId: number, updateCommentContentDto: UpdateCommentContentDto) {

         return this.prisma.comment.update({
            where: {
              comment_id: commentId
            },
            data: updateCommentContentDto
          });
         
                
      }
    
      async softDeleteComment(commentId: number, softDeleteCommentDto: SoftDeleteCommentDto) {
         return this.prisma.comment.update({
          where: {
            comment_id: commentId,
          },
          data: softDeleteCommentDto
        });
      }
    
      async hardDeleteComment(commentId: number) {
        return this.prisma.comment.delete({
        where: {
          comment_id: commentId,
        },
      });
    }

}