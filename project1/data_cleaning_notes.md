Data Cleaning Notes
Dataset: 1,200 rows × 14 columns (no rows were added or removed)
Change Made: Missing Values in CouponCode Column
The only substantive change was filling in the 309 missing (blank) values in the CouponCode column with the placeholder "NIL".
Raw FileCleaned FileMissing CouponCode entries3090Representationblank/nullNIL
This is a standard null-handling approach — replacing blanks with a descriptive string makes the column consistent for analysis (e.g., filtering, grouping, pivot tables) without accidentally excluding those rows.

What Was NOT Changed
All other 13 columns are identical between the two files. Specifically:

No duplicates were found or removed (none existed in the raw data)
No rows were dropped
No outliers were removed
