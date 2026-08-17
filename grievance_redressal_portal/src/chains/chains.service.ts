import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateChainDto } from './dto/create-chain.dto';
import { UpdateChainAddressDto } from './dto/update-chain-address.dto';
import { UpdateChainNameDto } from './dto/update-chain-name.dto';

@Injectable()
export class ChainsService {

  constructor(private readonly prisma: PrismaService) {}
  
  async createChain(createChainDto: CreateChainDto) {
    
    return this.prisma.chain.create({
      data: createChainDto,
    });
  }

  async updateChainName(
    chainId: number,
    updateChainNameDto: UpdateChainNameDto,
  ) {
  return this.prisma.chain.update({
    where: {
      chain_id: chainId,
    },
    data: {
      chain_name: updateChainNameDto.chain_name,
    },
  });
  }
  
  async findAllChains() {
    return this.prisma.chain.findMany();
  }

  async findOneChain(id: number) {
    return this.prisma.chain.findUnique({
    where: {
      chain_id: id,
    },
  });
  }

  async updateChainAddress(chainId: number, 
    updateChainAddressDto: UpdateChainAddressDto) {
    return this.prisma.chain.update({
    where: {
      chain_id: chainId,
    },
    data: updateChainAddressDto
  })
  }

  async removeChain(chainId: number) {
    return this.prisma.chain.delete({
    where: {
      chain_id: chainId,
    },
  });
  }
}
