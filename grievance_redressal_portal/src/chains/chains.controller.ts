import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { UpdateChainNameDto } from './dto/update-chain-name.dto';
import { ChainsService } from './chains.service';
import { CreateChainDto } from './dto/create-chain.dto';
import { UpdateChainAddressDto } from './dto/update-chain-address.dto';

@Controller('chains')
export class ChainsController {
  constructor(private readonly chainsService: ChainsService) {}

  @Post('createChain')
  create(@Body() createChainDto: CreateChainDto) {
    return this.chainsService.create(createChainDto);
  }

  @Get()
  findAllChains() {
    return this.chainsService.findAllChains();
  }

  @Get(':id')
  findOneChain(@Param('id') id: string) {
    return this.chainsService.findOneChain(BigInt(id));
  }

 @Patch(':id/name')
updateChainName(
  @Param('id') id: string,
  @Body() updateChainNameDto: UpdateChainNameDto,
) {
  return this.chainsService.updateChainName(
    BigInt(id),
    updateChainNameDto,
  );
}

@Patch(':id/address')
updateChainAddress(
  @Param('id') id: string,
  @Body() updateChainAddressDto: UpdateChainAddressDto,
) {
  return this.chainsService.updateChainAddress(
    BigInt(id),
    updateChainAddressDto,
  );
}

@Delete(':id/remove')
  removeChain(@Param('id') id: string) {
    return this.chainsService.removeChain(BigInt(id));
  }
}
