import { PickType } from '@nestjs/swagger';
import { CommentUniversalDto } from './comment-universal.dto';

// PickType helps us select those fields that we want to include in the class.
export class CreateReplyDto extends PickType (
CommentUniversalDto,
['comment_id', 'comment_content', 'reply_id', 'user_id', 'post_id'] as const,
) {}