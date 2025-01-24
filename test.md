# test

{%   assign today = site.time | date: '%s'      %}
{%   assign start = '17-06-1996 04:00:00' | date: '%s'  %}
{%   assign secondsSince = today | minus: start     %}
{%   assign hoursSince = secondsSince | divided_by: 60 | divided_by: 60     %}
{%   assign daysSince = hoursSince | divided_by: 24  %}
{%   assign weeksSince = daysSince | divided_by: 7  %}
{%   assign lifeProp = weeksSince | divided_by: 4106.0  %}
{%   assign lifePerc = lifeProp | times: 100  %}
{%   assign lifePercRound = lifePerc | round  %}

Hours: {{hoursSince}}
Days: {{daysSince}}
Weeks: {{weeksSince}}
Life: {{lifeProp}}
LifePerc: {{lifePerc}}
perc round: {{lifePercRound}}
