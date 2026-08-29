import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreatePostDto } from './dto/create-post.dto';
import { UpdatePostTitleDto } from './dto/update-post-title.dto';
import { UpdatePostContentDto } from './dto/update-post-content.dto';
import { UpdatePostStatusDto } from './dto/update-post-status.dto';
import { SearchPostTitleDto } from './dto/search-post-title.dto';

@Injectable()
export class PostsService {
  constructor(private readonly prisma: PrismaService) {}
  
  async createPost(createPostDto: CreatePostDto) {
    return this.prisma.post.create({
      data: createPostDto
    });
  }

  async searchPostsByTitle(searchPostTitleDto: SearchPostTitleDto) {
    return this.prisma.$queryRaw`
    SELECT post_title
    FROM posts
    WHERE post_title ILIKE ${'%' + searchPostTitleDto.post_title + '%'};
  `;
  }

  async findAllPosts() {
    return this.prisma.post.findMany();
  }

  async findOnePost(postId: number) {
    return this.prisma.post.findUnique({
    where: {
      post_id: postId,
    },
  });
  }

  async updatePostTitle(postId: number, updatePostTitleDto: UpdatePostTitleDto) {
     return this.prisma.post.update({
      where: {
        post_id: postId,
      },
      data: updatePostTitleDto
    })
  }

  async updatePostContent(postId: number, updatePostContentDto: UpdatePostContentDto) {
     return this.prisma.post.update({
      where: {
        post_id: postId,
      },
      data: updatePostContentDto
    })
  }

  async updatePostStatus(postId: number, updatePostStatusDto: UpdatePostStatusDto) {
     return this.prisma.post.update({
      where: {
        post_id: postId,
      },
      data: updatePostStatusDto
    })
  }

  async removePost(postId: number) {
    return this.prisma.post.delete({
    where: {
      post_id: postId,
    },
  });
  }
}
