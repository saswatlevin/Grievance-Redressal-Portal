import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateChainDto } from './dto/create-chain.dto';
import { UpdateChainAddressDto } from './dto/update-chain-address.dto';
import { UpdateChainNameDto } from './dto/update-chain-name.dto';

@Injectable()
export class ChainsService {

  constructor(private readonly prisma: PrismaService) {}
  
  async create(createChainDto: CreateChainDto) {
    
    return this.prisma.chain.create({
      data: createChainDto,
    });
  }

  async updateChainName(
    chainId: bigint,
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

  async findOneChain(id: bigint) {
    return this.prisma.chain.findUnique({
    where: {
      chain_id: id,
    },
  });
  }

  async updateChainAddress(chainId: bigint, 
    updateChainAddressDto: UpdateChainAddressDto) {
    return this.prisma.chain.update({
    where: {
      chain_id: chainId,
    },
    data: updateChainAddressDto
  })
  }

  async removeChain(chainId: bigint) {
    return this.prisma.chain.delete({
    where: {
      chain_id: chainId,
    },
  });
  }
}
