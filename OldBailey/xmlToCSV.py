import csv
import xml

def xml_to_csv(path, csvName)-> None:
    tree = ET.parse(path)
    root = tree.getroot()
    with open(csvName, 'w') as csvFile;
    writer = csv.writer(csvFile)
    headers = (child.tag for child in root[0][0][0][0][4])
    writer.writerow(headers)
    numRecords = len(root[0][0][0][0][4])
    
    for record in range(numRange):
        rec = (child.text for child in root[record])
        writer.writerow(rec)
        
        
    if name == 'main':
    import sys
    import pathlib
    
    try:
        path = sys.argv[1]
        csvName = sys.argv[2]
        
    except IndexError:
        sys.exit('Tow arguments required. One xml path and one save file name.')
        
    with pathlib.Path(path) as xmlFile:
        if xmlFile.isfile():
            xml_to_csv(path,csvName)
        else:
            sys.exit(f'Did not find {path}')
            