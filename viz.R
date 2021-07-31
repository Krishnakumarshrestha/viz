library(dplyr)
library(ggplot2)


df<-readxl::read_excel("m_s_insurnace.xlsx") %>%
  janitor::clean_names()



df <- df %>%
  arrange(desc(market_share_percent)) %>%
  head(10)
plot1<-df %>%
  ggplot(aes(x=reorder(life_insurer,-market_share_percent),y=market_share_percent))+
  geom_col()+
  theme_classic()+
  ylim(0,35)




library(ggtext)
library(extrafont) # Fonts for plotting
# font_import() # Import system fonts (only need to run it once on your device) 
loadfonts(quiet = T) # Register system fonts (need to run it in every R session)




plot1 <- plot1 + 
  labs(title = "<span style = 'font-size: 18pt'><i>**T**op **1**0 **LIFE I**nsurance **C**ompany **I**n **N**epal<i/></span><br>In terms of Market Shares ") + 
  theme(plot.title = element_textbox_simple(size = 10,
                                            family = "Century Gothic",
                                            color = "#007575",
                                            fill = "#e0f2f2",
                                            halign = 0.5,
                                            lineheight = 1.5,
                                            padding = margin(5, 1, 5, 1), 
                                            margin = margin(0, 0, 5, 0)))

plot1
plot1 <- plot1 + 
  labs(x = "", y = "Market  Share <br><span style = 'font-size: 9pt;'>(**In** (%))</span>") + 
  theme(axis.title.y = element_textbox_simple(size = 14,
                                              family = "Arial",
                                              color = "#045a8d",
                                              fill = "#fff080",
                                              halign = 0.5,
                                              orientation = "left-rotated",
                                              r = unit(5, "pt"),
                                              padding = margin(4, 4, 4, 4),
                                              margin = margin(0, 0, 8, 0),
                                              minwidth = unit(2, "in"),
                                              maxwidth = unit(5, "in")))

plot1


plot1<- plot1 +
  labs(caption = "<i><span style = 'font-size: 15pt;'>Data source: Insurance Khabar </span><br>Retrieved July, 2021<i/>") + 
  theme(plot.caption = element_markdown(size = 12,
                                        family = "Helvetica",
                                        color = "grey50",
                                        lineheight = 1.5),
        axis.text.y = element_blank())
plot1


plot1 <- plot1 +
  geom_richtext(aes(y=market_share_percent,label = paste0(market_share_percent," %")), 
                size = 5,
                color = colorRampPalette(c("#a50f15", "#e66101"))(nrow( df)),
                fill = "transparent",
                angle = 45,
                hjust = 0.1,
                vjust = -0.1,
                label.r = unit(4, "pt"),
                label.padding = unit(c(1, 5, 1, 5), "pt"))
plot1<-plot1 +
  theme(axis.text.x = element_text(angle = 45, hjust=1,colour = "Black",face="bold",
                                   family = "Arial"))
plot1






