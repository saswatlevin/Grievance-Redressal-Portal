import { ApiProperty } from '@nestjs/swagger';

export class UpdateChainNameDto {
  @ApiProperty()
  chain_name!: string;
}