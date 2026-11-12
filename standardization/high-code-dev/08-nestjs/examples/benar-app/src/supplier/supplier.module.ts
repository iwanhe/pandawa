// NST-102, NST-103: satu module per domain; hanya service yang diekspor.
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { SupplierController } from './supplier.controller.js';
import { SupplierEntity } from './supplier.entity.js';
import { SupplierRepository } from './supplier.repository.js';
import { SupplierService } from './supplier.service.js';

@Module({
  imports: [TypeOrmModule.forFeature([SupplierEntity])],
  controllers: [SupplierController],
  providers: [SupplierService, SupplierRepository],
  exports: [SupplierService],
})
export class SupplierModule {}
