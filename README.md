# hw08-tanvimittal71

This repo is my submission for [Homework08](http://stat545.com/Classroom/assignments/hw08/hw08.html) for STAT547M.

In this assignment, I build upon the [app](https://deanattali.com/blog/building-shiny-apps-tutorial/#12-final-shiny-app-code) provided as a boilerplate.

The data used in this shiny app can be found [here](https://github.com/STAT545-UBC-students/hw08-tanvimittal71/blob/master/bcl/bcl-data.csv). This data was originaly extracted from [raw data](http://pub.data.gov.bc.ca/datasets/176284/BC_Liquor_Store_Product_Price_List.csv)(by Dean Attali) provided by [OpenDataBC](https://www.opendatabc.ca/dataset/bc-liquor-store-product-price-list-current-prices)

### Description:
* This app provides the plot and table of selected alcoholic beverage w.r.t alcoholic content in an interactive user-friendly manner. 
* The user can filter the data based on price range, location, type of beverage and even level of sweetness if beverage is Wine.

As I mentioned earlier that here I build upon a given basic app. Following are the new features added:
* Theme using shinythemes package
* Image of BC Liqour Store
* Display count of results found
* Separate tabs for Plot and Table
* Improved interactive table using DT package
* Conditional option to choose sweetness level for Wine

Final app has been deployed [here](https://tanvimittal.shinyapps.io/BCliquorapp/)

Also, you can find the code for this app [here](https://github.com/STAT545-UBC-students/hw08-tanvimittal71/blob/master/bcl/app.R)



