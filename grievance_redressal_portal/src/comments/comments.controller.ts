import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { CommentsService } from './comments.service';
import { CreateCommentDto } from './dto/create-comment.dto';
import { UpdateCommentContentDto } from './dto/update-comment-content.dto';
import { SoftDeleteCommentDto } from './dto/soft-delete-comment.dto';
import { SearchCommentsByPostDto } from './dto/search-comments-by-post.dto';


@Controller('comments')
export class CommentsController {
    constructor(private readonly commentsService: CommentsService) {}
    
    @Post('create_comment')
    createComment(@Body() createCommentDto: CreateCommentDto) {
        console.log("In createComment");
        return this.commentsService.createComment(createCommentDto);
    }

    @Get('display_all_post_comments/:post_id')
    displayAllPostComments(@Param('post_id', ParseIntPipe) post_id: number) {
        console.log("In displayAllPostComments");
        return this.commentsService.displayAllPostComments(post_id);
    }

    @Get('search_comments_by_post/:post_id')
    searchCommentsByPost(@Param('post_id', ParseIntPipe) post_id: number, @Body() searchCommentsByPostDto: SearchCommentsByPostDto) {
        console.log("In searchCommentsByPost");
        return this.commentsService.searchCommentsByPost(post_id, searchCommentsByPostDto);
    }

    @Patch('soft_delete_comment/:comment_id')
    softDeleteComment(@Param('comment_id', ParseIntPipe) comment_id: number, @Body() softDeleteCommentDto: SoftDeleteCommentDto) {
        console.log("In softDeleteComment");
        return this.commentsService.softDeleteComment(comment_id, softDeleteCommentDto)
    }

    @Delete('hard_delete_comment/:comment_id')
    hardDeleteComment(@Param('comment_id', ParseIntPipe) comment_id: number) {
        console.log("In hardDeleteComment");
        return this.commentsService.hardDeleteComment(comment_id);
    }

    @Patch('update_comment_content/:comment_id')
    updateCommentContent(@Param('comment_id', ParseIntPipe) comment_id: number, @Body() updateCommentContentDto: UpdateCommentContentDto) {
        console.log("In updateCommentContent");
        return this.commentsService.updateCommentContent(comment_id, updateCommentContentDto);
    }
}