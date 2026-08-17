import { ApiProperty } from '@nestjs/swagger';
import {IsInt, IsNotEmpty} from 'class-validator';

export class UpdateChainIdDto {
  @ApiProperty()
  @IsInt()
  @IsNotEmpty()
  outlet_id!: number;
  
  @ApiProperty()
  @IsInt()
  @IsNotEmpty()
  chain_id!: number;
}