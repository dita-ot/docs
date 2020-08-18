# Originally created by Lief Erickson
# Tested with Python 3.8.5 but should work with Python 3.x

# If you get this error    
#  shortdescElem = et.SubElement(topicmetaElem, "shortdesc").text = format(shortdescList[varPresentationLen])
#  IndexError: list index out of range
#
# Open the local HTML file and search for .* with this XPath: tr/td[3]/div[1]/div[1]
# Each of the highlighted <div> elements should have a following <div> with a summary in it. If not, the summary is missing
# and is the reason for the error.
# Paste this immediately below the highlighted div:
# <div class="agenda-author"><span class="small">No description.</span></div>
# Save the HTML file and rerun this script.


import requests, bs4, re, os
import lxml.etree as et

# TODO: Define a function to validate input as years 2014 and higher (but not higher than the current year)
year = input("From which year do you want to get the DITA-OT Day agenda? ") 

def getHtml():
    if year in ['2016', '2017', '2018', '2019']:
        print("The HTML file for that year was retrieved. However, some presentations from that year do not have a summary. You may need edit the local HTML file (see comments at the top of the Python file) and rerun the script, if necessary.")  

    # Get the DITA-OT Day Agenda page 
    varOtPage = requests.get('https://www.oxygenxml.com/events/{}/dita-ot_day.html'.format(year))
    # Make sure there are no errors getting the page
    varOtPage.raise_for_status()

    # Create folder for local HTML files retrieved from oxygenxml website
    if not os.path.exists('ditaotdaykeys'):
        os.makedirs('ditaotdaykeys')

    # Save the DITA-OT Day Agenda page locally if it doesn't exist.
    # This allows the local file to be changed (because the summary description is missing) without
    # fear of the local file being overwritten by this script.
    if not os.path.exists('ditaotdaykeys/dita-ot_day-{}.html'.format(year)):
        varPlayFile = open('ditaotdaykeys/dita-ot_day-{}.html'.format(year), 'wb')

        for chunk in varOtPage.iter_content(100000):
            varPlayFile.write(chunk)

        varPlayFile.close()
        print('The HTML file was saved to local_html/dita-ot_day-{}.html'.format(year))
    return

def parseHtml():
    # Parse the local file 
    varLocalFile = open('ditaotdaykeys/dita-ot_day-{}.html'.format(year), encoding="UTF-8")
    varLocalHtmlPage = bs4.BeautifulSoup(varLocalFile.read(), 'html.parser') 
    return varLocalHtmlPage


### Variables ###
# linkhref
def linkhref():
   
    linkhrefList = []
    # CSS selector
    linkhrefSelector = parseHtml().select('a[title="Video Presentation"]')

    for text in linkhrefSelector:
        linkhrefList.append(text['href'])

    return linkhrefList
    #print(linkhrefList)    

# linktext
def linktext():
    linktextList = []
    # CSS selector
    linktextSelector = parseHtml().select('td:nth-child(3) > h5')

    for text in linktextSelector:
        linktextList.append(text.getText())
        linktextList = [re.sub(r'( -\n .*)|(\n)|(  )|(Lightning Talk - )|(Lightning Talk: )','',text, flags=re.IGNORECASE) for text in linktextList] 
                                # remove space dash slash n and everything thereafter
                                # remove slash n
                                # remove double spaces
                                # remove Lightning Talk - AND Lightning Talk: 
    
    return linktextList    
    #print(linktextList)    

# keys (for keydef)
def keystext():
    keystextList = linktext()
    for text in linktext():
        keystextList = [re.sub(r'(\s)|(\?)|(\/)|(\")|(\,)|(\:)|(\.)|(\')|(\!)|(\()|(\))|(\“)|(\”)|(\’)','',space) for space in linktext()] # remove any whitespace ? / " , : . ' ! ( ) “ ” ’ TODO: create a defined list of invalid characters and reference it instead
    
    return keystextList
    #print(keystextList)    

# shortdesc
def shortdesc():
    shortdescList = []
    # CSS selector (note: nth-child was changed to nth-of-type)
    shortdescSelector = parseHtml().select('tr > td:nth-of-type(3) > div:nth-of-type(1) > div:nth-of-type(2)')
    
    # 2014, 2015 every presentation has a summary
    # 2016, 2017, 2018, 2019 not every presentation has a summary, leading to a mismatch in the len() count between prentation count and shortdesc count
    # It's usually the opening or closing presentation or both.
    for content in shortdescSelector:
        shortdescList.append(content.getText()) # Get a list of Shortdescs, but these contain newlines and extra spaces.
        shortdescList = [re.sub(r'\n', ' ',newline) for newline in shortdescList] # Remove newline and space 
        shortdescList = [re.sub(r'  ', '',doublespace) for doublespace in shortdescList] # Remove double spaces from Shortdesc list    
    
    return shortdescList


# author
def authors():
    authorsList = []
    authorSelector = parseHtml().select('h5 > span.author > span')

    for author in authorSelector:
        authorsList.append(author.getText())
        authorsList = [re.sub(r'\n', ' ',newline) for newline in authorsList] # Remove newline and space 
        authorsList = [re.sub(r'  ', '',doublespace) for doublespace in authorsList] # Remove double spaces from Authors list
    
    return authorsList
    #print(authorsList) # used for debugging   


### Constructing the ditamap ### 
def ditamap():

    mapElem = et.Element("map")
    # Comment
    commentElem = et.Comment(" This file was generated from dita-ot-day-ditamap-keys.py. ")
    mapElem.append(commentElem)
    
    # Map <title>
    et.SubElement(mapElem, "title").text = "DITA-OT Day {}".format(year) # Make YEAR a variable
        
    ## For each presentation, create a keydef and its topicmeta
    varPresentationLen = len(linktext())-1
    
    while varPresentationLen >= 0:
        # Keydef
        keydefElem = et.SubElement(mapElem, "keydef", keys="{}-{}".format(keystext()[varPresentationLen],year), href="https://www.oxygenxml.com/events/{}/dita-ot_day.html{}".format(year,linkhref()[varPresentationLen]), format="html", scope="external")
        
        # Topicmeta
        topicmetaElem = et.SubElement(keydefElem, "topicmeta")
        
        # linktext (Does not need a *Elem variable name because it does not get referenced by another element)
        et.SubElement(topicmetaElem, "linktext").text = format(linktext()[varPresentationLen])
    
        # shortdesc (No *Elem variable. Same reason.)
        et.SubElement(topicmetaElem, "shortdesc").text = format(shortdesc()[varPresentationLen])
    
        # author (No *Elem variable. Same reason.)
        et.SubElement(topicmetaElem, "author").text = format(authors()[varPresentationLen])
    
        varPresentationLen = varPresentationLen-1

    return mapElem

def writeDitamap():    
    # Create ditaotdaykeys folder for DITA files
    if not os.path.exists('ditaotdaykeys'):
        os.makedirs('ditaotdaykeys')

    varDitamap = et.tostring(ditamap(), pretty_print=True, xml_declaration=True, encoding='UTF-8', doctype='<!DOCTYPE map PUBLIC "-//OASIS//DTD DITA Map//EN" "map.dtd">')

    file = open("ditaotdaykeys/dita-ot-day-{}.ditamap".format(year), "wb")
    file.write(varDitamap)
    print("File saved to " + 'ditaotdaykeys/dita-ot-day-{}.ditamap'.format(year) + ".")
    file.close()

def presentation():
    getHtml()
    parseHtml()
    ditamap()
    writeDitamap()

presentation()