# DTDI-DataAnalysis
###2d and 3d MDS data visualization
[DTDI project page](https://tw.rpi.edu//web/project/DTDI)

The original data is in the .xlsx file. It's a spreadsheet of ~730 rocks with their associated minerals.

I deleted the first three columns and saved it as `rocks.csv`, then imported the .csv into R `(header = TRUE)`.

`color.csv` is the groupings which the domain scientist assigned to the 51 minerals. Each group is assign a specific color in the visualizations. 

How distances are calculated on the MDS maps:
```
mineral 1 is contained in (a + b) types of rocks
mineral 2 is contained in (b + c) types of rocks
(b types of rocks contain both mineral 1 and mineral 2)
distance between mineral 1 and mineral 2 is calculated as:  1 - b / min((a + b), (b + c))
```
on macOS, [XQuartz]( https://www.xquartz.org/) needs to be installed along with the rgl R package to make the 3d plots work.



