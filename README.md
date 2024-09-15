# Junior Data Engineer Programme - Interim Project 
## Bicycles : Betcycle of 3 : How bicycle friendly is your neighbourhood? 

**Data Source:** 
- LTA Mall : [bike parking API](https://datamall.lta.gov.sg/content/datamall/en.html)
- 99.co : Information on District, Area, first 2 Digits of Postal Code 
- Kaggle :  [Singapore Postal codes, latitude, longitudes](https://www.kaggle.com/datasets/mylee2009/singapore-postal-code-mapper)
- OneMapAPI : [Reverse Geocode (For further exploration)](https://www.onemap.gov.sg/apidocs/apidocs/#reverseGeocode)


**Methods** 
- Extract data via: API and CSV file
- Libraries used: Requests, Pandas, Numpy, Matplotlib.pyplot, sqlalchemy
- Transform/clean data using pandas
- Database: PostgreSQL 

### Files: 
1. Extract_bike_data.ipynb:
    - Jupyter notebook to extract the bike data from LTA API. 
    - Runs API call through a loop of evenly spaced points across singapore to obtain all bicycle parking areas 
    

2. TransformLoad_biketables.ipynb:
    - Jupyter notebook to transform/clean bike data extracted from LTA API 
        - Transform table to obtain the district for each parking location    
    - Load tables into PostgreSQL (local host)  


3. Analysis (SQL)  
    - Objective 1: Most HDB bicycle parking lots among 3 districts (18 Jurong, 22 Woodlands, 25 Tampines)
    - Objective 2: From lowest 2, find the one with most number of sheltered bicycle parking locations.
    - Objective 3: Which area has more bus stops with bicycle parking facilities compared to Central District (1-4 & 6-9).


4. OneMap API (alternative to using Kaggle)
    - Used OneMap reverse geocode API to obtain postal codes by looping bike data latitude and longitude. 
    - API limit handling required due to 250calls/min limit
    - Transform results to obtain first 2 digits of postalcode 
    - Load into PostgreSQL (local host)
  