import { ApiProperty } from '@nestjs/swagger';
import {IsString, IsNotEmpty, MaxLength, Matches} from 'class-validator';
import {CHAIN_NAME_REGEX, CHAIN_NAME_MAXIMUM_LENGTH} from '../chains.constants';

export class UpdateChainNameDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @MaxLength(CHAIN_NAME_MAXIMUM_LENGTH)
  @Matches(CHAIN_NAME_REGEX)
  chain_name!: string;
}