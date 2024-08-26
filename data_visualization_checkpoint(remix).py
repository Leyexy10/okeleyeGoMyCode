#!/usr/bin/env python
# coding: utf-8

# # ###Dataset about "Climate Change in Africa" was provided by the US global change research programme 
# #
# # Dataset description : This dataset contains historical data about the daily min, max and average temperature fluctuation in 5 African countries (Egypt, Tunisia, Cameroon, Senegal, Angola) between 1980 and 2023.
# #
# # ###Instructions
# #
# # ###Load the dataset into a data frame using Python.
# # Clean the data as needed.
# # Plot a line chart to show the average temperature fluctuations in Tunisia and Cameroon. Interpret the results.
# # Zoom in to only include data between 1980 and 2005, try to customize the axes labels.
# # Create Histograms to show temperature distribution in Senegal between [1980,2000] and [2000,2023] (in the same figure). Describe the obtained results.
# # Select the best chart to show the Average temperature per country.
# # Make your own questions about the dataset and try to answer them using the appropriate visuals.

# In[2]:


#Libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import plotly.express as px
import plotly.graph_objects as go


# In[6]:


#Reading the CSV file with a filepath 
path = r"C:\Users\HP\Desktop\GMC\Africa_climate_change (2).csv"
Africa_climate_change = pd.read_csv(path)


# In[8]:


#Details about the provided dataset
Africa_climate_change.info()


# In[9]:


#Accessing the first 5 rows of the table
Africa_climate_change.head()


# # ###Data Cleansing very important

# In[10]:


Africa_climate_change['DATE']=pd.to_datetime(Africa_climate_change['DATE'])
Africa_climate_change.info()


# In[11]:


Africa_climate_change.describe()


# In[12]:


Africa_climate_change.isnull().sum()


# In[13]:


Africa_climate_change['PRCP'].fillna(0.120941, inplace=True )


# In[14]:


Africa_climate_change['TAVG'].fillna(77.029838, inplace=True )


# In[15]:


Africa_climate_change['TMAX'].fillna(88.713969, inplace=True )


# In[16]:


Africa_climate_change['TMIN'].fillna(65.548262, inplace=True )


# In[17]:


Africa_climate_change.isnull().sum()


# In[18]:


Africa_climate_change.dropna(inplace=True)


# In[19]:


Africa_climate_change


# In[60]:


#Plotting a line chart to indicate the average temperature fluctuations in Tunisia and Cameroon
Africa_climate_change['YEAR'] = Africa_climate_change['DATE'].dt.year
selected_countries = ['Tunisia', 'Cameroon']
Africa_climate_change_yearly = Africa_climate_change.groupby(['YEAR', 'COUNTRY'])['TAVG'].mean().reset_index()
fig = px.line(Africa_climate_change_yearly, x='YEAR', y='TAVG', color='COUNTRY', title='Average Yearly Temperature Fluctuations in Tunisia and Cameroon', labels={'YEAR': 'Year', 'TAVG': 'Average Temperature (℃)'})
fig.update_layout(legend_title_text='COUNTRY')
fig.show()


# In[61]:


#Plotting a line chart to indicate the average temperature fluctuations in Tunisia and Cameroon in 1980-2005
Year_Africa_climate_change= Africa_climate_change[(Africa_climate_change['YEAR']>=1980) & (Africa_climate_change['YEAR']<=2005)]
selected_countries = ['Tunisia', 'Cameroon']
Africa_climate_change_yearly = Year_Africa_climate_change.groupby(['YEAR', 'COUNTRY'])['TAVG'].mean().reset_index()
fig = px.line(Africa_climate_change_yearly, x='YEAR', y='TAVG', color='COUNTRY', title='Average Yearly Temperature Fluctuations in Tunisia and Cameroon', labels={'YEAR': 'Year', 'TAVG': 'Average Temperature (℃)'})
fig.update_layout(legend_title_text='COUNTRY')
fig.show()


# In[72]:


#Create Histograms to show temperature distribution in Senegal between [1980,2000] and [2000,2023] (in the same figure). Describe the obtained results.
senegal_1980_2000 = Africa_climate_change[(Africa_climate_change['YEAR']>=1980) & (Africa_climate_change['YEAR']<=2000)]
senegal_2000_2023 = Africa_climate_change[(Africa_climate_change['YEAR']>=2000) & (Africa_climate_change['YEAR']<=2023)]
selected_countries = [ 'Senegal']
Africa_climate_change_yearly = Year_Africa_climate_change.groupby(['YEAR'])['TAVG'].mean().reset_index()

fig=go.Figure()
fig.add_trace(go.Histogram(x=senegal_1980_2000['TAVG'], name='1980-2000', opacity=0.75))
fig.add_trace(go.Histogram(x=senegal_2000_2023['TAVG'], name='2000-2003', opacity=0.75))
fig.update_layout(title='Temperature Distribution in Senegal (1980, 2000 and 2000, 2023)', xaxis_title='Temperature (℃elsius)',yaxis_title='Frequency', barmode='overlay', height=700, width=1000)
fig.show()


# In[73]:


#displaying the suitable chart that best displays Average temperature by country  
fig= px.box(Africa_climate_change, x='COUNTRY', y='TAVG',  title='TAVG per country', height = 700, width= 1000)
fig.show()


# # ###Questions about the dataset and answering them using the appropriate visuals 

# In[55]:


#How has the average temperature in senegal changed over time?
senegal_data= Africa_climate_change[Africa_climate_change['COUNTRY'] == 'Senegal']
senegal_data = senegal_data.groupby(['YEAR', 'COUNTRY'])['TAVG'].mean().reset_index()
fig= px.line(senegal_data, x='YEAR', y='TAVG', color='COUNTRY',  labels={'TAVG': 'Average Temperature', 'YEAR': 'YEAR'}, title='Average Temperature in senegal over time')
fig.show

# Filter the data for Senegal
senegal_data= Africa_climate_change[Africa_climate_change['COUNTRY'] == 'Senegal']

# Group by 'YEAR' and 'COUNTRY', then calculate the average temperature
senegal_data = senegal_data.groupby(['YEAR'])['TAVG'].mean().reset_index()

# Create the line chart
fig = px.line(senegal_data, x='YEAR', y='TAVG',
              title='Average temperature in senegal',
              labels={'YEAR': 'Year', 'TAVG': 'Average Temperature (°C)'})

#fig.update_layout(legend_title_text='Country')
fig.show()


# In[ ]:





# In[28]:


#How do the average temperature of Tunisia and Cameroon compare over the years?
tunisia_data = Africa_climate_change[Africa_climate_change['COUNTRY'] == 'Tunisia']
cameroon_data = Africa_climate_change[Africa_climate_change['COUNTRY'] == 'Cameroon']

fig= px.line(tunisia_data, x='DATE', y='TAVG', color='COUNTRY')
fig.add_scatter(x=cameroon_data['DATE'],y=cameroon_data['TAVG'], mode='lines', name='Cameroon')

fig.update_layout(title='Average Temperature Comparison: Tunisia vs Cameroon', xaxis_title='Year', yaxis_title='Average Temperature (celsius)')
fig.show()


# In[26]:


#What is the distribution of average temperatures in Egypt over the last two decades?
Egypt_data = Africa_climate_change[(Africa_climate_change['COUNTRY'] == 'Egypt') & (Africa_climate_change['DATE'].dt.year >= 2003)]

fig = px.histogram(Egypt_data, x='TAVG', nbins=20, opacity=0.75, labels={'TAVG': 'Average Temperature (Celsius)'}, title='Temperature Distribution in Egypt (2003-2023)')
fig.update_layout(barmode='overlay')
fig.update_traces(marker_line_width=1, marker_line_color='black')
fig.show()

