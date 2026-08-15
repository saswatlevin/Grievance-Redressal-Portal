import { PartialType, OmitType } from '@nestjs/swagger';
import { CreateChainDto } from './create-chain.dto';

// Using PartialType allows only some fields to be updated.
// Using OmitType allows the chain_name field to be omitted.
export class UpdateChainAddressDto extends PartialType(
  OmitType(CreateChainDto, ['chain_name'] as const),
) {}