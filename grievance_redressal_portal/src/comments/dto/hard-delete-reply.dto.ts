import { PickType } from '@nestjs/swagger';
import { CommentUniversalDto } from './comment-universal.dto';

// PickType helps us select those fields that we want to include in the class.
export class HardDeleteReplyDto extends PickType (
   CommentUniversalDto,
   ['reply_id'] as const,
) {}