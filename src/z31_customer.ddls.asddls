@AbapCatalog.sqlViewName: 'Z31CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: ABAP Annotations'



define view Z31_Customer as select
                from scustom as c 
                                         
                  { key c.id,
                        concat_with_space(c.form,c.name , 1) as Name,
                        c.street,
                        c.postcode,
                        c.city,
                        c.country,
                        
                        @EndUserText.label: 'Discount Factor'
                        @EndUserText.quickInfo: 'Customer Specific Discount Factor'
                       division(cast(c.discount as abap.int4), 100, 2) as Discount
                     
                       

                    }
                    
 