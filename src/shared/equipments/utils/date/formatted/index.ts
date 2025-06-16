/* eslint-disable prettier/prettier */
import * as moment from 'moment-timezone';

moment.locale('');

export const dateFormatLocal = moment.tz().utc().subtract(4, 'hours').format();
