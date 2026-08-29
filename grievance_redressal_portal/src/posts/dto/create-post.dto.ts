import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {IsString, IsInt, IsEnum, IsNotEmpty, MaxLength, Matches} from 'class-validator';
import {PARAGRAPH_REGEX} from '../../common.constants';
import { POST_TITLE_MAXiMUM_LENGTH, 
    POST_CONTENT_MAXiMUM_LENGTH, 
    POST_STATUS} from '../posts.constants';

export class CreatePostDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @Matches(PARAGRAPH_REGEX)
  @MaxLength(POST_TITLE_MAXiMUM_LENGTH)
  post_title!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @Matches(PARAGRAPH_REGEX)
  @MaxLength(POST_CONTENT_MAXiMUM_LENGTH)
  post_content!: string;

  @ApiProperty()
  @IsInt()
  @IsNotEmpty()
  user_id!: number;

  @ApiProperty()
  @IsNotEmpty()
  @IsEnum(POST_STATUS)
  post_status!: POST_STATUS;

};
