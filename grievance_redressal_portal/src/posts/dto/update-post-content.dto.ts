import { PartialType, OmitType } from '@nestjs/swagger';
import { CreatePostDto } from './create-post.dto';

// Using PartialType allows only some fields to be updated.
// Using OmitType allows the necessary fields to be omitted.
export class UpdatePostContentDto extends PartialType(
  OmitType(CreatePostDto, ['post_title', 'post_status', 'user_id'] as const),
) {}