import { Test, TestingModule } from '@nestjs/testing';
import { validate } from 'class-validator';
import { plainToInstance } from 'class-transformer';

import { ChainsService } from './chains.service';
import { PrismaModule } from '../prisma/prisma.module';
import { PrismaService } from '../prisma/prisma.service';
import { CreateChainDto } from './dto/create-chain.dto';
import { UpdateChainNameDto } from './dto/update-chain-name.dto';

describe('ChainsService - CreateChain', () => {
  let service: ChainsService;
  let prisma: PrismaService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      imports: [PrismaModule],
      providers: [ChainsService],
    }).compile();

    service = module.get<ChainsService>(ChainsService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  afterAll(async () => {
    await prisma.$disconnect();
  });

  async function validateDto(data: object) {
    const dto = plainToInstance(CreateChainDto, data);
    return validate(dto);
  }

  it('1. should reject an empty request body', async () => {
    const errors = await validateDto({});

    expect(errors.length).toBeGreaterThan(0);
  });

  it('2. should create a chain with all non-null attributes', async () => {
    const data = {
      chain_name: 'Test Chain',
      chain_headquarters_address_room_no: '12',
      chain_headquarters_address_building: 'Test Building',
      chain_headquarters_address_street: 'Test Street',
      chain_headquarters_address_city: 'Test City',
      chain_headquarters_address_admin_division: 'Test Division',
      chain_headquarters_address_country: 'India',
      chain_headquarters_address_post_code: '560001',
    };

    const errors = await validateDto(data);

    expect(errors.length).toBe(0);

    const chain = await service.createChain(
      plainToInstance(CreateChainDto, data),
    );

    expect(chain).toBeDefined();
    expect(chain.chain_name).toBe('Test Chain');
  });

  it('3. should reject a chain without chain_name', async () => {
    const data = {
      chain_name: '',
      chain_headquarters_address_street: 'Test Street',
      chain_headquarters_address_city: 'Test City',
      chain_headquarters_address_country: 'India',
      chain_headquarters_address_post_code: '560001',
    };

    const errors = await validateDto(data);

    expect(errors.length).toBeGreaterThan(0);
    
  });

  // Test 4: CreateChain - missing city

it('4. should reject a chain without chain_headquarters_address_city', async () => {
  const data = {
    chain_name: 'Test Chain',
    chain_headquarters_address_room_no: '12',
    chain_headquarters_address_building: 'Test Building',
    chain_headquarters_address_street: 'Test Street',
    chain_headquarters_address_country: 'India',
    chain_headquarters_address_post_code: '560001',
  };

  const errors = await validateDto(data);

  expect(errors.length).toBeGreaterThan(0);
});


// Test 5: CreateChain - missing post code

it('5. should reject a chain without chain_headquarters_address_post_code', async () => {
  const data = {
    chain_name: 'Test Chain',
    chain_headquarters_address_room_no: '12',
    chain_headquarters_address_building: 'Test Building',
    chain_headquarters_address_street: 'Test Street',
    chain_headquarters_address_city: 'Test City',
    chain_headquarters_address_country: 'India',
  };

  const errors = await validateDto(data);

  expect(errors.length).toBeGreaterThan(0);
});

describe('UpdateChainName', () => {
    it('1. should reject an empty request body', async () => {
      const dto = plainToInstance(UpdateChainNameDto, {});
      const errors = await validate(dto);

      expect(errors.length).toBeGreaterThan(0);
    });

    it('2. should accept chain_name containing only numbers', async () => {
      const dto = plainToInstance(UpdateChainNameDto, {
        chain_name: '1234',
      });

      const errors = await validate(dto);
      expect(errors.length).toEqual(0);
    });

    it('3. should validate chain_name containing letters and numbers', async () => {
      const dto = plainToInstance(UpdateChainNameDto, {
        chain_name: 'McDonalds123',
      });

      const errors = await validate(dto);
      expect(errors.length).toBe(0);
    });

    it('4. should validate chain_name containing letters only', async () => {
      const dto = plainToInstance(UpdateChainNameDto, {
        chain_name: 'McDonalds',
      });

      const errors = await validate(dto);
      expect(errors.length).toBe(0);
    });
  });

  describe('removeChain', () => {
  it('1. should reject an invalid/empty chain ID', async () => {
    await expect(
      service.removeChain(undefined as any),
    ).rejects.toThrow();
  });

  it('2. should delete the chain with chain_id 16', async () => {
    const chain = await service.removeChain(16);

    expect(chain.chain_id).toBe(16);

    const deletedChain = await prisma.chain.findUnique({
      where: {
        chain_id: 16,
      },
    });

    expect(deletedChain).toBeNull();
  });

  it('3. should fail to delete the chain with chain_id 17 since it does not exist', async () => {
     await expect(
    service.removeChain(17),
  ).rejects.toThrow();
  });

  it('4. should fail to delete chain with chain_id 2 because it has related outlets', async () => {
  await expect(
    service.removeChain(2),
  ).rejects.toThrow();
});

});  

});

