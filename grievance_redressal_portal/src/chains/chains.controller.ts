import { Controller, Get, Post, Body, Patch, Param, Delete, ParseIntPipe } from '@nestjs/common';
import { UpdateChainNameDto } from './dto/update-chain-name.dto';
import { ChainsService } from './chains.service';
import { CreateChainDto } from './dto/create-chain.dto';
import { UpdateChainAddressDto } from './dto/update-chain-address.dto';
import { SearchChainsByNameDto } from './dto/search-chain-name.dto';

@Controller('chains')
export class ChainsController {
  constructor(private readonly chainsService: ChainsService) {}

  @Post('create_chain')
  createChain(@Body() createChainDto: CreateChainDto) {
    return this.chainsService.createChain(createChainDto);
  }

  @Get('find_all_chains')
  findAllChains() {
    console.log("In findAllChains");
    return this.chainsService.findAllChains();
  }

  @Get('find_one_chain/:id')
  findOneChain(@Param('id', ParseIntPipe) id: number) {
    console.log("In findOneChain");
    return this.chainsService.findOneChain(id);
  }

  @Get('search_chains_by_name/')
  searchChainsByName(@Body() searchChainsByNameDto: SearchChainsByNameDto) {
    console.log("In searchChainsByName");
    return this.chainsService.searchChainsByName(searchChainsByNameDto);
  }

@Patch('update_chain_name/:id')
updateChainName(
  @Param('id', ParseIntPipe) id: number,
  @Body() updateChainNameDto: UpdateChainNameDto,
) {
  console.log("In updateChainName");
  return this.chainsService.updateChainName(
    id,
    updateChainNameDto,
  );
}

@Patch('update_chain_address/:id')
updateChainAddress(
  @Param('id', ParseIntPipe) id: number,
  @Body() updateChainAddressDto: UpdateChainAddressDto,
) {
  console.log("In updateChainAddress");
  return this.chainsService.updateChainAddress(
    id,
    updateChainAddressDto,
  );
}

@Delete('remove_chain/:id')
  removeChain(@Param('id', ParseIntPipe) id: number) {
    console.log("In removeChain");
    return this.chainsService.removeChain(id);
  }
}
