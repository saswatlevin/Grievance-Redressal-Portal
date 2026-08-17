import { PartialType, OmitType } from '@nestjs/swagger';
import { CreateOutletDto } from './create-outlet.dto';

// Using PartialType allows only some fields to be updated.
// Using OmitType allows the outlet_name and chain_id fields to be omitted.
export class UpdateOutletAddressDto extends PartialType(
  OmitType(CreateOutletDto, ['outlet_name', 'chain_id'] as const),
) {}