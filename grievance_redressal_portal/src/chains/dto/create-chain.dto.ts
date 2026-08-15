import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

// For all mandatory fields, use the definite assignmetn operator "!"
export class CreateChainDto {
  @ApiProperty()
  chain_name!: string;

  @ApiPropertyOptional()
  chain_headquarters_address_room_no?: string;

  @ApiPropertyOptional()
  chain_headquarters_address_building?: string;

  @ApiProperty()
  chain_headquarters_address_street!: string;

  @ApiProperty()
  chain_headquarters_address_city!: string;

  @ApiPropertyOptional()
  chain_headquarters_address_admin_division?: string;

  @ApiProperty()
  chain_headquarters_address_country!: string;

  @ApiProperty()
  chain_headquarters_address_post_code!: string;
}