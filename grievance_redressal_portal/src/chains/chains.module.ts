import { Module } from '@nestjs/common';
import { ChainsService } from './chains.service';
import { ChainsController } from './chains.controller';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
  controllers: [ChainsController],
  providers: [ChainsService],
  imports: [PrismaModule]
})
export class ChainsModule {}
