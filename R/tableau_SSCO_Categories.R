# ' SSCO Categories for Tableau calcs
#'
#' SSCO Incident Categories, derived from short description.
#' @param col_string col name in string format
#' @keywords calculated fields, regex
#' @export
#' @examples
#' test
tableau_SSCO_Categories <- function(col_string){

  require(dplyr); require(stringr)

  out <- case_when(
               str_detect(col_string, "(?i)loading\\W?delayed\\W?intervention") ~ 'Loading Delayed Intervention',
               str_detect(col_string, "(?i)dispenser|coin recycl|coin accept|\\bcoin|note recycl") ~ 'Dispenser Issues',
               str_detect(col_string, "(?i)declar|variance") ~ 'Declarations/Variance',
               str_detect(col_string, "(?i)shut\\W?down|reboot|crash|powered off") ~ '(Lane shutdown)',

               str_detect(col_string, "(?i)stuck transaction") ~ 'Stuck Transaction',
               str_detect(col_string, "(?i)log\\W?in") ~ 'Login Issues',
               str_detect(col_string, "(?i)upgrade|fail(ed)?\\W?valida|validation\\W?fail") ~ 'Upgrade/Validation Failures',
               str_detect(col_string, "(?i)scale") &
                 str_detect(col_string, "^(?!bag\\W?holder)") ~ 'Scale Issues',  # excluding bag holder incidents
               str_detect(col_string, "(?i)bar\\W?code") ~ 'Barcode Issues',
               str_detect(col_string, "(?i)pick\\W?up") ~ 'Pickup Issues',
               str_detect(col_string, "(?i)not (populat|recogni)|unsellable item er") ~ 'Item Not Populating',
               str_detect(col_string, "(?i)offline") ~ 'Offline',
               str_detect(col_string, "(?i)latency|slow") ~ 'Latency',
               str_detect(col_string, "(?i)loop") ~ 'Looping',
               str_detect(col_string, "(?i)\\btare\\b") ~ 'Tare',
               str_detect(col_string, "(?i)print") ~ 'Printer Issues',
               str_detect(col_string, "(?i)rec(ei|ie)pt") ~ 'Receipt Issues',
               str_detect(col_string, "(?i)qr\\W?code") ~ 'QR Code Issues',
               str_detect(col_string, "(?i)void") ~ 'Voiding Issues',
               str_detect(col_string, "(?i)qr\\W?code") ~ 'QR Code Issues',
               str_detect(col_string, "(?i)out of sync") ~ 'Out of Sync Issue',
               str_detect(col_string, "(?i)(\\b)nonop(\\b)") ~ '#NONOP',
               str_detect(col_string, "(?i)Availability Indicator Light") ~ 'Availability Indicator Light',
               str_detect(col_string, "(?i)Gathering Logs") ~ 'Gathering Logs Message',
               str_detect(col_string, "(?i)touch screen|button") ~ 'Menu/Button Issue',
               str_detect(col_string, "(?i)display") ~ 'Display Issue',
               str_detect(col_string, "(?i)age (verif|restric)") ~ 'Age Restriction Issues',
               str_detect(col_string, "(?i)(\\b)rap(\\b)") ~ 'RAP Issues',


               str_detect(col_string, "(?i)(\\b)cash(\\b)") ~ 'Cash Issues',  # low priority. cash is broad
               str_detect(col_string, "(?i)(\\b)EOD(\\b)|eod of day") ~ 'EOD Issues',  # low priority
               str_detect(col_string, "(?i)MSR|payment") ~ 'MSR/Payment Issue',  # 'payment' maybe too broad

               str_detect(col_string, "(?i)freez|froz") ~ "(Freezing Issues)",  # freezing is broad
               str_detect(col_string, "(?i)scan") ~ 'Scanning Issues',  # low priority

               TRUE ~ "Other"
    )

  return(out)
}
