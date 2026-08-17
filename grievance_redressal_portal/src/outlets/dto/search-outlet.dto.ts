import { PartialType, OmitType } from '@nestjs/swagger';
import { UpdateOutletNameDto } from './update-outlet-name.dto';

// Using PartialType allows only some fields to be updated.
// Using OmitType allows the outlet_id field to be omitted.
export class SearchOutletDto extends PartialType(
  OmitType(UpdateOutletNameDto, ['outlet_id'] as const),
) {}