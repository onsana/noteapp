require 'rails_helper'

describe Api::V1::NotesController, type: :request do
  # initialize test data
  let!(:notes) { create_list(:note, 10) }
  let(:note_id) { notes.first.id }

  describe 'GET /api/v1/notes' do
    before { get api_v1_notes_path }

    it 'returns todos' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/notes/:id' do
    before { get "/api/v1/notes/#{note_id}" }

    context 'when the record exists' do
      it 'returns the note' do
        json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(note_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:note_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Note/)
      end
    end
  end

  describe 'POST /api/v1/notes' do
    # valid payload
    let(:valid_attributes) { { note: { title: 'Learn Ruby', content: "This is the first note" } } }

    context 'when the request is valid' do
      before { post api_v1_notes_path, params: valid_attributes }

      it 'creates a todo' do
        json = JSON.parse(response.body)
        expect(json['title']).to eq('Learn Ruby')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post api_v1_notes_path, params: { note: { title: 'Foobar' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/can't be blank"/)
      end
    end
  end

  describe 'PUT /api/v1/notes/:id' do
    let(:valid_attributes) { { note: { title: 'Learn JS', content: "This is the edit note" } } }

    context 'when the record exists' do
      before { put "/api/v1/notes/#{note_id}", params: valid_attributes }

      it 'updates the record' do
        json = JSON.parse(response.body)
        expect(json['title']).to eq('Learn JS')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/v1/notes/:id' do
    before { delete "/api/v1/notes/#{note_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
