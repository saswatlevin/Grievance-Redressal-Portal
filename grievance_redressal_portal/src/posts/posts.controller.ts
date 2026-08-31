import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { PostsService } from './posts.service';
import { CreatePostDto } from './dto/create-post.dto';
import { UpdatePostTitleDto } from './dto/update-post-title.dto';
import { UpdatePostContentDto } from './dto/update-post-content.dto';
import { UpdatePostStatusDto } from './dto/update-post-status.dto';
import { SearchPostTitleDto } from './dto/search-post-title.dto';

@Controller('posts')
export class PostsController {
  constructor(private readonly postsService: PostsService) {}

  @Post('create_post')
  createPost(@Body() createPostDto: CreatePostDto) {
    console.log("In createPost");
    return this.postsService.createPost(createPostDto);
  }

  @Get('find_all_posts')
  findAllPosts() {
    console.log("In findAllPosts");
    return this.postsService.findAllPosts();
  }

  @Get('find_one_post/:post_id')
  findOnePost(@Param('post_id', ParseIntPipe) post_id: number) {
    console.log("In findOnePost");
    return this.postsService.findOnePost(post_id);
  }

  @Get('search_posts_by_title')
  searchPostsByTitle(@Body() searchPostTitleDto: SearchPostTitleDto) {
    console.log("In searchPostsByTitle");
    return this.postsService.searchPostsByTitle(searchPostTitleDto);
  }

  @Patch('update_post_title/:post_id')
  updatePostTitle(@Param('post_id', ParseIntPipe) post_id: number, @Body() updatePostTitleDto: UpdatePostTitleDto) {
    console.log("In updatePostTitle");
    return this.postsService.updatePostTitle(post_id, updatePostTitleDto);
  }

  @Patch('update_post_content/:post_id')
  updatePostContent(@Param('post_id', ParseIntPipe) post_id: number, @Body() updatePostContentDto: UpdatePostContentDto) {
    console.log("In updatePostContent");
    return this.postsService.updatePostContent(post_id, updatePostContentDto);
  }

  @Patch('update_post_status/:post_id')
  updatePostStatus(@Param('post_id', ParseIntPipe) post_id: number, @Body() updatePostStatusDto: UpdatePostStatusDto) {
    console.log("In updatePostStatus");
    return this.postsService.updatePostStatus(post_id, updatePostStatusDto);
  }

  @Delete('remove_post/:post_id')
  removePost(@Param('post_id', ParseIntPipe) post_id: number) {
    console.log("In removePost");
    return this.postsService.removePost(post_id);
  }
  
}
