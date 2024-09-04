Global changes:

- (BE) Update Style selection values to match [P] naming convention
    
    - Heading Styles
        
        - Title 1 → TBD _Display Small_ `pds-text-display-sm`
            
        - Title 2 → TBD _Title Large_ `pds-text-title-lg`
            
        - Title 3 → TBD Title Medium `pds-text-title-md`
            
    - Subheading Styles
        
        - Title 4 → TBD Title Small `pds-text-title-sm`
            
        - Subtitle → TBD Body Large `pds-text-body-lg`
            
- (FE) Module height, container width, padding/margin changes across all variants
    
- (FE) Any other global component changes to match [P] not already being made
    
- (BE) New configuration to add a logo/small image above the component’s header
    

Background Hero Variation (previously know as Tall variant):

- (FE) Darkening gradient for tall/short variation when content as card is NOT used
    
    - Note: this configuration will be allowed moving forward by exception and used sparingly depending on background image used
        
- (FE) Padding, container width, alignment improvements to text block (“content as card”)
    

Standard 50/50 Variation:

- (BE) New variation to Hero Variant Type
    
- (BE) All same configurations as other variants
    
    - Foreground image included
        
- (FE / BE) Image position - left/right
    
- (FE) Content alignment always left-aligned no matter if right or left of image.
    
- (FE) When logo image is included, appears/placed above component’s header
    

Short 50/50 Variation:

- (BE) Previously known as “Short” variant, now follows 50/50 layout due to size.
    
- (FE) When logo image is included, appears/placed above component’s header
    
- (FE) Fix image responsiveness in mobile
    
- (FE - maybe BE if this changes what is visible?) Three possible combinations: header only, logo + header, or header + CTA