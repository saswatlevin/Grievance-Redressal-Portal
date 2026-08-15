import { OmitType } from '@nestjs/swagger';
import { CreateChainDto } from './create-chain.dto';

export class UpdateChainAddressDto extends OmitType(
  CreateChainDto,
  ['chain_name'] as const,
) {}