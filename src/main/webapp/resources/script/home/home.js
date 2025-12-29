document.addEventListener('DOMContentLoaded', () => {
  const dateContainer = document.getElementById('dateFilters');
  const matchList = document.getElementById('matchList');

  const today = new Date();
  // Manually set date for sample dataset
  today.setDate(20);
  for (let i = 0; i < 8; i++) {
    const d = new Date();
    d.setDate(today.getDate() + i);
    const offset = d.getTimezoneOffset() * 60000;
    const localISOTime = (new Date(d - offset)).toISOString().split('T')[0];
    const displayStr = (d.getMonth() + 1) + '/' + d.getDate();
    const btn = document.createElement('div');
    btn.innerHTML = `
      <input type="radio" class="btn-check" name="matchDate" id="date${i}" value="${localISOTime}" ${i === 0 ? 'checked' : ''}>
      <label class="btn btn-outline-secondary text-nowrap" for="date${i}">${displayStr}</label>
    `;
    dateContainer.appendChild(btn.firstElementChild);
    dateContainer.appendChild(btn.lastElementChild);
  }

  const matchTypeMap = {
    'INDIVIDUAL': '개인',
    'RENT': '대여',
    'TEAM': '팀',
  };

  const matchTypeMapReverse = {
    '개인': 'INDIVIDUAL',
    '대여': 'RENT',
    '팀': 'TEAM',
  };

  const matchGenderMap = {
    'BOTH': '혼성',
    'FEMALE': '여성 전용',
    'MALE': '남성 전용',
  };

  const matchGradeMap = {
    0: '미배정',
    1: '초보',
    2: '중수',
    3: '고수',
  };

  function fetchMatches() {
    const date = document.querySelector('input[name="matchDate"]:checked').value;
    const region = document.getElementById('regionFilter').value;
    const typeUI = document.querySelector('input[name="matchType"]:checked').value;
    const type = matchTypeMapReverse[typeUI] || typeUI;

    fetch(`/api/matches?date=${date}&region=${region}&type=${type}`)
        .then(res => res.json())
        .then(data => {
          renderMatches(data);
        })
        .catch(err => {
          matchList.innerHTML = `<div class="alert alert-danger">데이터를 불러오는데 실패했습니다.</div>`;
        });
  }

  function renderMatches(matches) {
    if (matches.length === 0) {
      matchList.innerHTML = `<div class="text-center py-5 text-muted">해당 조건에 맞는 매치가 없습니다.</div>`;
      return;
    }
    matchList.innerHTML = matches.map(match => {
      const typeLabel = matchTypeMap[match.matchType] || match.matchType;
      const displayTime = match.startHour ? match.startHour.substring(0, 5) : '00:00';
      const gender = matchGenderMap[match.gender] || match.gender;
      const minGrade = matchGradeMap[match.minGrade] || match.minGrade;
      const maxGrade = matchGradeMap[match.maxGrade] || match.maxGrade;

      return `
      <div class="col-12 col-md-6 col-lg-4">
        <div class="card h-100 shadow-sm border-0">
          <div class="card-body">
            <div class="d-flex justify-content-between align-items-start mb-2">
              <span class="badge ${match.matchType === 'INDIVIDUAL' ? 'bg-info' : 'bg-warning text-dark'}">${typeLabel}</span>
              <span class="text-primary fw-bold">${displayTime}</span>
            </div>
            <h5 class="card-title fw-bold">${match.stadiumName || '경기장 명칭'}</h5>
            <p class="card-text text-muted small">${match.region} | ${gender} | ${minGrade}~${maxGrade}</p>
            <div class="d-flex justify-content-between align-items-center mt-3">
              <span class="fw-bold">${match.status} 명 참여중</span>
              <a href="/match/${match.matchId}" class="btn btn-sm btn-primary">상세보기</a>
            </div>
          </div>
        </div>
      </div>
    `;
    }).join('');
  }

  document.getElementById('dateFilters').addEventListener('change', fetchMatches);
  document.getElementById('regionFilter').addEventListener('change', fetchMatches);
  document.getElementsByName('matchType').forEach(el => el.addEventListener('change', fetchMatches));

  fetchMatches();
});
