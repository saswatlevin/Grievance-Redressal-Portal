import { Module } from '@nestjs/common';
import { PrismaModule } from '../prisma/prisma.module';
import { CommentsController } from './comments.controller';
import { CommentsService } from './comments.service';

@Module({
    controllers: [CommentsController],
    providers: [CommentsService],
    imports: [PrismaModule]
})
export class Commentsodule {}