# %%
import pandas as pd
from welly import Well, Location

# %%
path_to_csv = 'I:\PycharmProjects\gostin\data\well_survey_from_earth_model.csv'

# %%
# First we need to separate each
all_wells = pd.read_csv(path_to_csv)

# %%
unique_id = all_wells['Well ID'].unique()
unique_id

# %%
# Transform dip to inclination
all_wells['Dip'] -= 90


# %%


p = Well.from_las(r'I:\PycharmProjects\gostin\data\58-32_main.las')
# %%

# Load deviation on a df
dev1 = all_wells.loc[[0,1]]

# Create empyy well
well1 = Well(params={'header': {'name':dev1['Well ID'][0]}})
well1.location = Location(params={'kb':100})

# %%

well1.location.add_deviation(dev1[['Depth (m)', 'Dip', 'Azimuth']].values)

# %%
well1.location.position

# %%
well1.location.
