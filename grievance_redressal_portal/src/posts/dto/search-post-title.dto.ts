import { PartialType, OmitType } from '@nestjs/swagger';
import { CreatePostDto } from './create-post.dto';

// Using PartialType allows only some fields to be updated.
// Using OmitType allows the necessary fields to be omitted.
export class SearchPostTitleDto extends PartialType (
    OmitType(CreatePostDto, ['post_content', 'post_status', 'user_id'] as const),
){}