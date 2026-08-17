import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { OutletsService } from './outlets.service';
import { CreateOutletDto } from './dto/create-outlet.dto';
import { UpdateOutletNameDto } from './dto/update-outlet-name.dto';
import { SearchOutletDto } from './dto/search-outlet.dto';
import { UpdateOutletAddressDto } from './dto/update-outlet-address.dto';

@Controller('outlets')
export class OutletsController {
  constructor(private readonly outletsService: OutletsService) {}

  @Post('create_outlet')
  createOutlet(@Body() createOutletDto: CreateOutletDto) {
    console.log('In createOutlet');
    return this.outletsService.createOutlet(createOutletDto);
  }

  @Get('find_all_outlets')
  findAllOutlets() {
    console.log('In findAllOutlets');
    return this.outletsService.findAllOutlets();
  }

  @Post('search_outlets_by_name')
  searchOutletsByName(@Body() searchOutletDto: SearchOutletDto) {
    return this.outletsService.searchOutletsByName(searchOutletDto);
  }

  // ParseIntPipe validates the fact that the _id is an Integer.
  @Get('find_one_outlet/:outlet_id')
  findOneOutlet(@Param('outlet_id', ParseIntPipe) outlet_id: number) {
    return this.outletsService.findOneOutlet(outlet_id);
  }

  @Patch('update_outlet_name/:outlet_id')
  updateOutletName(@Param('outlet_id', ParseIntPipe) outlet_id: number, @Body() updateOutletNameDto: UpdateOutletNameDto) {
    return this.outletsService.updateOutletName(outlet_id, updateOutletNameDto);
  }

  @Patch('update_outlet_address/:outlet_id')
  updateOutletAddress(@Param('outlet_id', ParseIntPipe) outlet_id: number, @Body() updateOutletAddressDto: UpdateOutletAddressDto) {
    return this.outletsService.updateOutletAddress(outlet_id, updateOutletAddressDto);
  }

  @Delete('remove_outlet/:outlet_id')
  removeOutlet(@Param('outlet_id', ParseIntPipe) outlet_id: number) {
    return this.outletsService.removeOutlet(outlet_id);
  }
}
