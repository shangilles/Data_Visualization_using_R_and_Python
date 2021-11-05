# Load Packages
library(ggplot2)
library(dplyr)
library(readr)
library(plotly)

# Crime Rates By State
crime_df <- read_csv("US_violent_crime.csv")
head(crime_df)

# Scatterplot
ggplot(crime_df, aes(x=UrbanPop, y=Assault , label = X1)) +
  geom_point(color="blue", size=3) +
  labs(x="Urban Population (per 100000)", y="Assault (per 100000)", title="Urban Population versus Assault (per 100k) in US States (1973)") +

  # Remove background and grid
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_blank())+
  geom_text(hjust=0, vjust=0)


# Bubble Chart

# Using Area to size bubble
# Ensure to set size of bubble to area instead of diameter
t <- list(
  family = "sans serif",
  size = 14,
  color = toRGB("grey50"))

fig <- plot_ly(crime_df, x= ~UrbanPop, y= ~Assault, text = ~X1, type = 'scatter',
               marker = list(size = ~Assault, sizemode = "area", opacity = 0.9))
fig <- fig %>% add_text(textfont = t, textposition = "top right")
# Add titles & stacks
fig <- fig %>% layout(title = 'Urban Population versus Assault (per 100k) in US States (1973)',
                      xaxis = list(title = "Urban Population (per 100000)", showgrid = FALSE),
                      yaxis = list(title = "Assault (per 100000)", showgrid = FALSE))


fig


# Density Plot

birth_rates = read_csv('birth-rates.csv')

ggplot(birth_rates, aes(x = `2008`)) +
  geom_density(color="black", size=0.9) +
  labs(x="Birth rates in 2008", title="Live births per 1,000 population") +
  
  # Remove background and grid
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_blank())

