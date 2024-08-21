# AGN-Photometry

Photometry.ipynb contains the whole project.

Tables folder:

1) fits_info_table: 
- Object Name: The object name is retrieved from the OBJECT keyword in the primary header of each FITS file. This provides the designated name of the astronomical object observed.

- Target ID: The target name is extracted from the TARG_ID keyword in the primary header of the FITS file, representing the specific ID associated with the target of the observation.

- Observation ID: The observation ID is retrieved from the OBS_ID keyword in the primary header of each FITS file. This is a unique identifier for the observation session.

- Filter: The filter name comes from the FILTER keyword in the primary header of each FITS file. It indicates which filter was used during the observation, defining the wavelength range of light captured.

- Exposure Time: The exposure time is derived from the EXPOSURE keyword, located in the first extension header of each FITS file. It represents the total time the detector was exposed to light during the observation.

- Date/Time of Observation: The date and time of the observation are retrieved from the DATE-OBS keyword in the primary header. It indicates when the observation started.

- RA (J2000) and Dec (J2000): These RA and Dec values are derived through individual aperture choices for each source. These represent the centroids of the sources as calculated manually or by software during aperture photometry.

- RA (degrees) and Dec (degrees): These are the RA and Dec values converted from sexagesimal format to degrees for ease of use in further calculations.

- Redshift: The redshift values are retrieved from the NASA/IPAC Extragalactic Database (NED) using the object name. This value is either found in the redshift catalog or, if not available, is marked as 'N/A'.

- 2MASS RA (degrees) and 2MASS Dec (degrees): These are the RA and Dec values derived from the 2MASS All-Sky Extended Source Catalog (XSC). This catalog provides accurate RA and Dec coordinates for extended objects in the sky, which are cross-referenced to match the sources in the FITS files.

2) 2MASS table:
- Most of the table is just the output derived from a tabular search on the 2MASS All-Sky Extended Source Catalog.

- E(B-V) and E(B-V) errors: The values in this column are derived through individual source searches using the Galactic Dust Reddening and Extinction tool https://irsa.ipac.caltech.edu/applications/DUST/

- 3 sources PG0804+761, PG0844+349 and RBS1124 were not present in the 2MASS XSC, so their IR magnitudes have been derived from the Point Source Catalog and added under j_m_5, h_m_5 and k_m_5 columns. However, the magnitudes of these 3 sources are calculated using a 4" aperture so keep that in mind when using these values for other purposes.

