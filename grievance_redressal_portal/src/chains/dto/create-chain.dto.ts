import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {IsString, IsNotEmpty, MaxLength} from 'class-validator';

// For all mandatory fields, use the definite assignmetn operator "!"
export class CreateChainDto {
  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @MaxLength(100)
  chain_name!: string;

  @ApiPropertyOptional()
  @IsString()
  @MaxLength(5)
  chain_headquarters_address_room_no?: string;

  @ApiPropertyOptional()
  @IsString()
  @MaxLength(50)
  chain_headquarters_address_building?: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @MaxLength(100)
  chain_headquarters_address_street!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @MaxLength(100)
  chain_headquarters_address_city!: string;

  @ApiPropertyOptional()
  @IsString()
  @MaxLength(100)
  chain_headquarters_address_admin_division?: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @MaxLength(100)
  chain_headquarters_address_country!: string;

  @ApiProperty()
  @IsString()
  @IsNotEmpty()
  @MaxLength(12)
  chain_headquarters_address_post_code!: string;
}