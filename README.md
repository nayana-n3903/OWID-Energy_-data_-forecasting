🌍 OWID Energy Data Forecasting – Clean Energy Adoption
📖 Overview
This project leverages the Our World in Data (OWID) energy dataset to forecast future clean energy adoption. The workflow includes cleaning 20k+ rows of raw data, deploying Facebook Prophet for time series forecasting, and publishing an interactive Tableau Public dashboard. The analysis identifies which countries are on track to achieve clean energy targets and highlights the growth rates required for others to meet sustainability goals.

🔑 Key Highlights
Data Cleaning

Processed and cleaned 20,000+ rows of OWID energy data.

Standardized formats, handled missing values, and prepared structured datasets for forecasting.
Forecasting with Facebook Prophet

Deployed FB Prophet to model renewable energy growth trajectories.

Tuned seasonality, changepoints, and parameters for improved accuracy.

Generated forecasts to determine clean energy adoption timelines.

Visualization & Insights

Published a live Tableau Public dashboard with interactive filters (country, energy type, forecast horizon).

Identified which countries will attain clean energy targets and which countries must accelerate growth rates to achieve sustainability goals.

🏢 Business Impact
Policy Guidance: Helps governments and regulators understand which nations are on track and where intervention is needed.

Strategic Planning: Provides businesses and energy companies with insights to align investments with future clean energy demand.

Global Sustainability: Supports international organizations in monitoring progress toward climate goals and renewable energy adoption.
Decision Support: Empowers stakeholders with data‑driven evidence to prioritize resources and accelerate energy transition strategies.

🛠️ Tech Stack
Python: Pandas, NumPy, Prophet

SQL: Data validation and aggregation

Visualization: Tableau Public, Matplotlib, Seaborn

📊 Live Dashboard
👉 Explore here:[https://public.tableau.com/views/Globalenergytransitionforecasting/Globalenergytransistion?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link]

📂 Repository Structure

├── data/               # Raw and cleaned OWID datasets
├── notebooks/          # Jupyter notebooks for cleaning & forecasting
├── models/             # Prophet models and outputs
├── visuals/            # Tableau dashboard snapshots
├── README.md           # Project documentation

