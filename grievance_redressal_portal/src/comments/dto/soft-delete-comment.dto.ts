import { PickType } from '@nestjs/swagger';
import { CommentUniversalDto } from './comment-universal.dto';

// PickType helps us select those fields that we want to include in the class.
export class SoftDeleteCommentDto extends PickType (
   CommentUniversalDto,
   ['comment_is_deleted'] as const,
) {}