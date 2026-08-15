import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

// Implements BigInt serialization
// That is, allows the conversion of BigInt to JSON in the response.
(BigInt.prototype as any).toJSON = function () {
  return this.toString();
};

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(process.env.PORT ?? 3000);
}

bootstrap();
