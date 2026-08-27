import { ApiProperty } from '@nestjs/swagger';
import {IsString, IsInt, IsNotEmpty, MaxLength, Matches} from 'class-validator';
import {OUTLET_NAME_REGEX, OUTLET_NAME_MAXIMUM_LENGTH} from '../outlets.constants';

export class UpdateOutletNameDto  {
    @ApiProperty()
    @IsString()
    @IsNotEmpty()
    @MaxLength(OUTLET_NAME_MAXIMUM_LENGTH)
    @Matches(OUTLET_NAME_REGEX)
    outlet_name!: string;
}
