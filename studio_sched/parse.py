import re
from bs4 import BeautifulSoup

RIGHT_OFFSET_RE = re.compile(r'.*right:(\d*)px')

def get_right_offset(lesson_soup):
    return int(RIGHT_OFFSET_RE.match(lesson_soup.attrs['style']).groups()[0])

def calc_day_step(lessons_soup):
    known_steps = set()
    for lesson in lessons_soup:
        known_steps.add(get_right_offset(lesson))
    known_steps = sorted(known_steps)
    min_step = None
    for i, val in enumerate(known_steps):
        if i == 0:
            continue
        step = known_steps[i] - known_steps[i-1]
        if (not min_step) or (step < min_step):
            min_step = step
    return min_step

def name_for_hall(hall_soup):
    return hall_soup.select('.hall-name')[0].text

def get_lesson_time(lesson_soup):
    times = lesson_soup.select('.hallLessonTime')[0].text.split('-')
    return times

def lessons_for_hall(hall):
    hall_name = name_for_hall(hall)
    lesson_elements = hall.select('.hallLesson')
    day_step = calc_day_step(lesson_elements)
    ret = []
    for el in lesson_elements:
        ret.append({
            'name' : el.select('.hallLessonText')[0].text,
            'hall' : hall_name,
            'day' : int(get_right_offset(el) / day_step),
            'time' : get_lesson_time(el)
        })
    return ret

def halls_from_sched(sched):
    return sched.select('.hall')

def parse_sched(sched_text):
    soup = BeautifulSoup(sched_text)
    lessons = []
    halls = halls_from_sched(soup)
    for hall in halls:
        lessons.extend(lessons_for_hall(hall) or [])
    return dict(lessons = lessons)
