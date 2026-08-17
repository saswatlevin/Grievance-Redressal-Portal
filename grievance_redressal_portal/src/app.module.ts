import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { PrismaModule } from './prisma/prisma.module';
import { ChainsModule } from './chains/chains.module';
import { OutletsModule } from './outlets/outlets.module';

@Module({
  imports: [UsersModule, PrismaModule, ChainsModule, OutletsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
