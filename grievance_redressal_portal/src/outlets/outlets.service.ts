import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateOutletDto } from './dto/create-outlet.dto';
import { UpdateOutletNameDto } from './dto/update-outlet-name.dto';
import { SearchOutletDto } from './dto/search-outlet.dto';
import { UpdateOutletAddressDto } from './dto/update-outlet-address.dto';


@Injectable()
export class OutletsService {
  constructor(private readonly prisma: PrismaService) {}

  async createOutlet(createOutletDto: CreateOutletDto) {
  return this.prisma.outlet.create({
    data: createOutletDto
  });
}

  async findAllOutlets() {
    return this.prisma.outlet.findMany();
  }

  async searchOutletsByName(searchOutletDto: SearchOutletDto) {
  return this.prisma.$queryRaw`
    SELECT outlet_name
    FROM outlets
    WHERE outlet_name ILIKE ${searchOutletDto.outlet_name + '%'};
  `;
}

  async findOneOutlet(outletId: number) {
    return this.prisma.outlet.findUnique({
    where: {
      outlet_id: outletId,
    },
  });
  }

  

  async updateOutletName(outletId: number, updateOutletNameDto: UpdateOutletNameDto) {
       return this.prisma.outlet.update({
    where: {
      outlet_id: outletId,
    },
    data: {
      outlet_name: updateOutletNameDto.outlet_name,
    },
  })
  }

  async updateOutletAddress(outletId: number, 
    updateOutletAddressDto: UpdateOutletAddressDto) {
      return this.prisma.outlet.update({
      where: {
        outlet_id: outletId,
      },
      data: updateOutletAddressDto
    })
  }

  
  async removeOutlet(outletId: number) {
    return this.prisma.outlet.delete({
    where: {
      outlet_id: outletId,
    },
  });
}
}