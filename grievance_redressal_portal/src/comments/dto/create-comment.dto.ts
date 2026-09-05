import { PickType } from '@nestjs/swagger';
import { CommentUniversalDto } from './comment-universal.dto';

// PickType helps us select those fields that we want to include in the class.
export class CreateCommentDto extends PickType (
CommentUniversalDto,
['comment_content', 'post_id', 'user_id'] as const,
) {}