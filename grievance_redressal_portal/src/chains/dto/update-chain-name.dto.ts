import { ApiProperty } from '@nestjs/swagger';
import {IsString, IsNotEmpty, MaxLength} from 'class-validator';

export class UpdateChainNameDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @MaxLength(100)
  chain_name!: string;
}