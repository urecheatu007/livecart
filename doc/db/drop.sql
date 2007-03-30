# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases v4.1.3                     #
# Target DBMS:           MySQL 4                                         #
# Project file:          LiveCart.dez                                    #
# Project name:          LiveCart                                        #
# Author:                Integry Systems                                 #
# Script type:           Database drop script                            #
# Created on:            2007-03-30 19:19                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Drop foreign key constraints                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE Product DROP FOREIGN KEY Category_Product;

ALTER TABLE Product DROP FOREIGN KEY Manufacturer_Product;

ALTER TABLE Product DROP FOREIGN KEY ProductImage_Product;

ALTER TABLE Category DROP FOREIGN KEY Category_Category;

ALTER TABLE Category DROP FOREIGN KEY CategoryImage_Category;

ALTER TABLE SpecificationItem DROP FOREIGN KEY SpecFieldValue_SpecificationItem;

ALTER TABLE SpecificationItem DROP FOREIGN KEY Product_SpecificationItem;

ALTER TABLE SpecificationItem DROP FOREIGN KEY SpecField_SpecificationItem;

ALTER TABLE SpecField DROP FOREIGN KEY Category_SpecField;

ALTER TABLE SpecField DROP FOREIGN KEY SpecFieldGroup_SpecField;

ALTER TABLE SpecFieldValue DROP FOREIGN KEY SpecField_SpecFieldValue;

ALTER TABLE CustomerOrder DROP FOREIGN KEY User_CustomerOrder;

ALTER TABLE OrderedItem DROP FOREIGN KEY Product_OrderedItem;

ALTER TABLE OrderedItem DROP FOREIGN KEY CustomerOrder_OrderedItem;

ALTER TABLE OrderedItem DROP FOREIGN KEY Shipment_OrderedItem;

ALTER TABLE User DROP FOREIGN KEY UserBillingAddress_User;

ALTER TABLE User DROP FOREIGN KEY UserShippingAddress_User;

ALTER TABLE AccessControlList DROP FOREIGN KEY User_AccessControlList;

ALTER TABLE AccessControlList DROP FOREIGN KEY RoleGroup_AccessControlList;

ALTER TABLE AccessControlList DROP FOREIGN KEY Role_AccessControlList;

ALTER TABLE UserGroup DROP FOREIGN KEY User_UserGroup;

ALTER TABLE UserGroup DROP FOREIGN KEY RoleGroup_UserGroup;

ALTER TABLE Filter DROP FOREIGN KEY FilterGroup_Filter;

ALTER TABLE FilterGroup DROP FOREIGN KEY SpecField_FilterGroup;

ALTER TABLE ProductRelationship DROP FOREIGN KEY Product_RelatedProduct_;

ALTER TABLE ProductRelationship DROP FOREIGN KEY Product_ProductRelationship;

ALTER TABLE ProductRelationship DROP FOREIGN KEY ProductRelationshipGroup_ProductRelationship;

ALTER TABLE ProductPrice DROP FOREIGN KEY Product_ProductPrice;

ALTER TABLE ProductPrice DROP FOREIGN KEY Currency_ProductPrice;

ALTER TABLE ProductImage DROP FOREIGN KEY Product_ProductImage;

ALTER TABLE ProductFile DROP FOREIGN KEY Product_ProductFile;

ALTER TABLE Discount DROP FOREIGN KEY Product_Discount;

ALTER TABLE CategoryImage DROP FOREIGN KEY Category_CategoryImage;

ALTER TABLE SpecificationNumericValue DROP FOREIGN KEY Product_SpecificationNumericValue;

ALTER TABLE SpecificationNumericValue DROP FOREIGN KEY SpecField_SpecificationNumericValue;

ALTER TABLE SpecificationStringValue DROP FOREIGN KEY Product_SpecificationStringValue;

ALTER TABLE SpecificationStringValue DROP FOREIGN KEY SpecField_SpecificationStringValue;

ALTER TABLE SpecificationDateValue DROP FOREIGN KEY Product_SpecificationDateValue;

ALTER TABLE SpecificationDateValue DROP FOREIGN KEY SpecField_SpecificationDateValue;

ALTER TABLE SpecFieldGroup DROP FOREIGN KEY Category_SpecFieldGroup;

ALTER TABLE ProductRelationshipGroup DROP FOREIGN KEY Product_ProductRelationshipGroup;

ALTER TABLE ProductReview DROP FOREIGN KEY Product_ProductReview;

ALTER TABLE ProductReview DROP FOREIGN KEY User_ProductReview;

ALTER TABLE UserBillingAddress DROP FOREIGN KEY User_UserBillingAddress;

ALTER TABLE UserBillingAddress DROP FOREIGN KEY UserAddress_UserBillingAddress;

ALTER TABLE Transaction DROP FOREIGN KEY CustomerOrder_Transaction;

ALTER TABLE Shipment DROP FOREIGN KEY CustomerOrder_Shipment;

ALTER TABLE UserShippingAddress DROP FOREIGN KEY User_UserShippingAddress;

ALTER TABLE UserShippingAddress DROP FOREIGN KEY UserAddress_UserShippingAddress;

ALTER TABLE OrderNote DROP FOREIGN KEY CustomerOrder_OrderNote;

ALTER TABLE OrderNote DROP FOREIGN KEY User_OrderNote;

ALTER TABLE DeliveryZoneCountry DROP FOREIGN KEY DeliveryZone_DeliveryZoneCountry;

ALTER TABLE DeliveryZoneState DROP FOREIGN KEY DeliveryZone_DeliveryZoneState;

ALTER TABLE DeliveryZoneState DROP FOREIGN KEY State_DeliveryZoneState;

ALTER TABLE DeliveryZoneCityMask DROP FOREIGN KEY DeliveryZone_DeliveryZoneCityMask;

ALTER TABLE DeliveryZoneZipMask DROP FOREIGN KEY DeliveryZone_DeliveryZoneZipMask;

ALTER TABLE DeliveryZoneAddressMask DROP FOREIGN KEY DeliveryZone_DeliveryZoneAddressMask;

ALTER TABLE TaxRate DROP FOREIGN KEY TaxType_TaxRate;

ALTER TABLE TaxRate DROP FOREIGN KEY DeliveryZone_TaxRate;

# ---------------------------------------------------------------------- #
# Drop table "Product"                                                   #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Product ALTER COLUMN isEnabled DROP DEFAULT;

ALTER TABLE Product ALTER COLUMN isBestSeller DROP DEFAULT;

ALTER TABLE Product ALTER COLUMN type DROP DEFAULT;

ALTER TABLE Product ALTER COLUMN voteSum DROP DEFAULT;

ALTER TABLE Product ALTER COLUMN voteCount DROP DEFAULT;

ALTER TABLE Product ALTER COLUMN hits DROP DEFAULT;

ALTER TABLE Product DROP PRIMARY KEY;

# Drop table #

DROP TABLE Product;

# ---------------------------------------------------------------------- #
# Drop table "Category"                                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Category ALTER COLUMN activeProductCount DROP DEFAULT;

ALTER TABLE Category ALTER COLUMN totalProductCount DROP DEFAULT;

ALTER TABLE Category ALTER COLUMN isEnabled DROP DEFAULT;

ALTER TABLE Category DROP PRIMARY KEY;

# Drop table #

DROP TABLE Category;

# ---------------------------------------------------------------------- #
# Drop table "Language"                                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Language ALTER COLUMN isDefault DROP DEFAULT;

ALTER TABLE Language ALTER COLUMN position DROP DEFAULT;

ALTER TABLE Language DROP PRIMARY KEY;

# Drop table #

DROP TABLE Language;

# ---------------------------------------------------------------------- #
# Drop table "SpecificationItem"                                         #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE SpecificationItem DROP PRIMARY KEY;

# Drop table #

DROP TABLE SpecificationItem;

# ---------------------------------------------------------------------- #
# Drop table "SpecField"                                                 #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE SpecField ALTER COLUMN type DROP DEFAULT;

ALTER TABLE SpecField ALTER COLUMN dataType DROP DEFAULT;

ALTER TABLE SpecField ALTER COLUMN position DROP DEFAULT;

ALTER TABLE SpecField DROP PRIMARY KEY;

# Drop table #

DROP TABLE SpecField;

# ---------------------------------------------------------------------- #
# Drop table "SpecFieldValue"                                            #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE SpecFieldValue ALTER COLUMN position DROP DEFAULT;

ALTER TABLE SpecFieldValue DROP PRIMARY KEY;

# Drop table #

DROP TABLE SpecFieldValue;

# ---------------------------------------------------------------------- #
# Drop table "CustomerOrder"                                             #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE CustomerOrder DROP PRIMARY KEY;

# Drop table #

DROP TABLE CustomerOrder;

# ---------------------------------------------------------------------- #
# Drop table "OrderedItem"                                               #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE OrderedItem DROP PRIMARY KEY;

# Drop table #

DROP TABLE OrderedItem;

# ---------------------------------------------------------------------- #
# Drop table "User"                                                      #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE User DROP PRIMARY KEY;

# Drop table #

DROP TABLE User;

# ---------------------------------------------------------------------- #
# Drop table "AccessControlList"                                         #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE AccessControlList DROP PRIMARY KEY;

# Drop table #

DROP TABLE AccessControlList;

# ---------------------------------------------------------------------- #
# Drop table "RoleGroup"                                                 #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE RoleGroup ALTER COLUMN parent DROP DEFAULT;

ALTER TABLE RoleGroup DROP PRIMARY KEY;

# Drop table #

DROP TABLE RoleGroup;

# ---------------------------------------------------------------------- #
# Drop table "UserGroup"                                                 #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE UserGroup DROP PRIMARY KEY;

# Drop table #

DROP TABLE UserGroup;

# ---------------------------------------------------------------------- #
# Drop table "Filter"                                                    #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Filter DROP PRIMARY KEY;

# Drop table #

DROP TABLE Filter;

# ---------------------------------------------------------------------- #
# Drop table "FilterGroup"                                               #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE FilterGroup ALTER COLUMN position DROP DEFAULT;

ALTER TABLE FilterGroup DROP PRIMARY KEY;

# Drop table #

DROP TABLE FilterGroup;

# ---------------------------------------------------------------------- #
# Drop table "Role"                                                      #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Role DROP PRIMARY KEY;

# Drop table #

DROP TABLE Role;

# ---------------------------------------------------------------------- #
# Drop table "ProductRelationship"                                       #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE ProductRelationship ALTER COLUMN position DROP DEFAULT;

ALTER TABLE ProductRelationship DROP PRIMARY KEY;

# Drop table #

DROP TABLE ProductRelationship;

# ---------------------------------------------------------------------- #
# Drop table "ProductPrice"                                              #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE ProductPrice DROP PRIMARY KEY;

# Drop table #

DROP TABLE ProductPrice;

# ---------------------------------------------------------------------- #
# Drop table "Currency"                                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Currency ALTER COLUMN isDefault DROP DEFAULT;

ALTER TABLE Currency ALTER COLUMN isEnabled DROP DEFAULT;

ALTER TABLE Currency ALTER COLUMN position DROP DEFAULT;

ALTER TABLE Currency DROP PRIMARY KEY;

# Drop table #

DROP TABLE Currency;

# ---------------------------------------------------------------------- #
# Drop table "Manufacturer"                                              #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Manufacturer DROP PRIMARY KEY;

# Drop table #

DROP TABLE Manufacturer;

# ---------------------------------------------------------------------- #
# Drop table "ProductImage"                                              #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE ProductImage ALTER COLUMN position DROP DEFAULT;

ALTER TABLE ProductImage DROP PRIMARY KEY;

# Drop table #

DROP TABLE ProductImage;

# ---------------------------------------------------------------------- #
# Drop table "ProductFile"                                               #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE ProductFile ALTER COLUMN position DROP DEFAULT;

ALTER TABLE ProductFile DROP PRIMARY KEY;

# Drop table #

DROP TABLE ProductFile;

# ---------------------------------------------------------------------- #
# Drop table "Discount"                                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Discount DROP PRIMARY KEY;

# Drop table #

DROP TABLE Discount;

# ---------------------------------------------------------------------- #
# Drop table "CategoryImage"                                             #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE CategoryImage ALTER COLUMN position DROP DEFAULT;

ALTER TABLE CategoryImage DROP PRIMARY KEY;

# Drop table #

DROP TABLE CategoryImage;

# ---------------------------------------------------------------------- #
# Drop table "SpecificationNumericValue"                                 #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE SpecificationNumericValue DROP PRIMARY KEY;

# Drop table #

DROP TABLE SpecificationNumericValue;

# ---------------------------------------------------------------------- #
# Drop table "SpecificationStringValue"                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE SpecificationStringValue DROP PRIMARY KEY;

# Drop table #

DROP TABLE SpecificationStringValue;

# ---------------------------------------------------------------------- #
# Drop table "SpecificationDateValue"                                    #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE SpecificationDateValue DROP PRIMARY KEY;

# Drop table #

DROP TABLE SpecificationDateValue;

# ---------------------------------------------------------------------- #
# Drop table "State"                                                     #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE State DROP PRIMARY KEY;

# Drop table #

DROP TABLE State;

# ---------------------------------------------------------------------- #
# Drop table "PostalCode"                                                #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE PostalCode DROP PRIMARY KEY;

# Drop table #

DROP TABLE PostalCode;

# ---------------------------------------------------------------------- #
# Drop table "SpecFieldGroup"                                            #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE SpecFieldGroup ALTER COLUMN position DROP DEFAULT;

ALTER TABLE SpecFieldGroup DROP PRIMARY KEY;

# Drop table #

DROP TABLE SpecFieldGroup;

# ---------------------------------------------------------------------- #
# Drop table "ProductRelationshipGroup"                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE ProductRelationshipGroup ALTER COLUMN position DROP DEFAULT;

ALTER TABLE ProductRelationshipGroup DROP PRIMARY KEY;

# Drop table #

DROP TABLE ProductRelationshipGroup;

# ---------------------------------------------------------------------- #
# Drop table "HelpComment"                                               #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE HelpComment DROP PRIMARY KEY;

# Drop table #

DROP TABLE HelpComment;

# ---------------------------------------------------------------------- #
# Drop table "ProductReview"                                             #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE ProductReview DROP PRIMARY KEY;

# Drop table #

DROP TABLE ProductReview;

# ---------------------------------------------------------------------- #
# Drop table "UserAddress"                                               #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE UserAddress DROP PRIMARY KEY;

# Drop table #

DROP TABLE UserAddress;

# ---------------------------------------------------------------------- #
# Drop table "UserBillingAddress"                                        #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE UserBillingAddress DROP PRIMARY KEY;

# Drop table #

DROP TABLE UserBillingAddress;

# ---------------------------------------------------------------------- #
# Drop table "Transaction"                                               #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Transaction DROP PRIMARY KEY;

# Drop table #

DROP TABLE Transaction;

# ---------------------------------------------------------------------- #
# Drop table "Shipment"                                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE Shipment DROP PRIMARY KEY;

# Drop table #

DROP TABLE Shipment;

# ---------------------------------------------------------------------- #
# Drop table "UserShippingAddress"                                       #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE UserShippingAddress DROP PRIMARY KEY;

# Drop table #

DROP TABLE UserShippingAddress;

# ---------------------------------------------------------------------- #
# Drop table "OrderNote"                                                 #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE OrderNote DROP PRIMARY KEY;

# Drop table #

DROP TABLE OrderNote;

# ---------------------------------------------------------------------- #
# Drop table "DeliveryZone"                                              #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE DeliveryZone DROP PRIMARY KEY;

# Drop table #

DROP TABLE DeliveryZone;

# ---------------------------------------------------------------------- #
# Drop table "DeliveryZoneCountry"                                       #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE DeliveryZoneCountry DROP PRIMARY KEY;

# Drop table #

DROP TABLE DeliveryZoneCountry;

# ---------------------------------------------------------------------- #
# Drop table "DeliveryZoneState"                                         #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE DeliveryZoneState DROP PRIMARY KEY;

# Drop table #

DROP TABLE DeliveryZoneState;

# ---------------------------------------------------------------------- #
# Drop table "DeliveryZoneCityMask"                                      #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE DeliveryZoneCityMask DROP PRIMARY KEY;

# Drop table #

DROP TABLE DeliveryZoneCityMask;

# ---------------------------------------------------------------------- #
# Drop table "DeliveryZoneZipMask"                                       #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE DeliveryZoneZipMask DROP PRIMARY KEY;

# Drop table #

DROP TABLE DeliveryZoneZipMask;

# ---------------------------------------------------------------------- #
# Drop table "DeliveryZoneAddressMask"                                   #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE DeliveryZoneAddressMask DROP PRIMARY KEY;

# Drop table #

DROP TABLE DeliveryZoneAddressMask;

# ---------------------------------------------------------------------- #
# Drop table "TaxType"                                                   #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE TaxType DROP PRIMARY KEY;

# Drop table #

DROP TABLE TaxType;

# ---------------------------------------------------------------------- #
# Drop table "TaxRate"                                                   #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE TaxRate DROP PRIMARY KEY;

# Drop table #

DROP TABLE TaxRate;

# ---------------------------------------------------------------------- #
# Drop table "ShippingRate"                                              #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE ShippingRate DROP PRIMARY KEY;

# Drop table #

DROP TABLE ShippingRate;
